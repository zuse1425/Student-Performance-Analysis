'''
The exception.py file is needed to handle exceptions in the project. 
It contains code to create custom exceptions and handle errors in a 
structured way. By defining custom exceptions, we can provide more 
meaningful error messages and handle specific types of errors. 
The file also includes code to log the exceptions using the logger module, 
which helps in tracking and debugging errors in the project.
'''

import sys
#The sys module in Python provides various functions and
#variables that are used to manipulate different parts of the 
#Python runtime environment.

from src.logger import logging

def error_message_detail(error,error_detail:sys):
    _,_,exc_tb=error_detail.exc_info()
    file_name=exc_tb.tb_frame.f_code.co_filename
    error_message="Error occured in python script name [{0}] line number [{1}] error message[{2}]".format(
     file_name,exc_tb.tb_lineno,str(error))

    return error_message

    

class CustomException(Exception):
    def __init__(self,error_message,error_detail:sys):
        super().__init__(error_message)
        self.error_message=error_message_detail(error_message,error_detail=error_detail)
    
    def __str__(self):
        return self.error_message


    