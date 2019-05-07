# -*- coding: utf-8 -*-
"""
Created on Mon Mar 11 15:58:04 2019

@author: jmonc
"""

def fib(n):
    a, b = 0,1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()
fib(1000)
