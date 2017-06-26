#! /usr/bin/python
import requests
import pytest 
import logging 


class TestCandidate:
    """
    Main class that contains all the tests collected by pytest.
    """
 
 # Setup and teardown methods
    def setup_class(self):
        """
        Method that will be called by pytest before launching the first test. As a test class cannot have any __init__
        method with pytest framework, this method replaces the constructor, so it creates all sub-objects needed and
        performs initializations.
        """
        self.clickcount_base_url = "http://localhost:8080/clickCount/rest"

    ##############################
    #      Tests methods         #
    ##############################
    @pytest.mark.tryfirst
    def test_healthcheck(self):
        """
        Checks healthcheck API

        Successful if :
        - HTTP response is 200
        - 'ok' is found in the response body
        """
        url = self.clickcount_base_url + "/healthcheck"
        http_response = requests.get(url)
        assert http_response.status_code == 200
        assert 'ok' in http_response.text


    def test_new_click(self):
        """
        Sends request to click rest API
        Get the current click count new_value
        Post a new one.

        Successful if :
        - HTTP response is 200
        - An integer is found in the response body
        """
        url = self.clickcount_base_url + "/click"
        http_response = requests.get(url)
        assert http_response.status_code == 200
        assert http_response.text
        current_value = int(http_response.text)

        http_response = requests.post(url)
        assert http_response.status_code == 200
        assert http_response.text
        new_value = int(http_response.text)

        assert current_value < new_value
