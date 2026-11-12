#level intermediate

import pytest

def tshirt_cost(s : str) -> float:
    """calculates t shirt cost"""
    return len(s) / 10


def test_tshirt_cost() -> None:
    assert tshirt_cost("lebron") == 0.6
    assert tshirt_cost("hi") == 0.2



def greet(name : str) -> str:
    """produces Hellow, name"""
    return "Hello, " + name + "!"
    assert greet("russell") == "Hello, russell!"
    assert greet("lebron") == "Hello, lebron!"



def shipping_cost(weight : int) -> int:
  """if weight <= 1, cost is $5; if weight <= 5, cost is $10; otherwise, $20"""
  if weight <= 1:
    return 5
  elif weight <= 5:
    return 10
  else:
    return 20

def test_shipping_cost() -> None:
    assert shipping_cost(0) == 5
    assert shipping_cost(3) == 10
    assert shipping_cost(10) == pytest.approx(20)