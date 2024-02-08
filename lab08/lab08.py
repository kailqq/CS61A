def make_generators_generator(g):
    """Generates all the "sub"-generators of the generator returned by
    the generator function g.

    >>> def every_m_ints_to(n, m):
    ...     i = 0
    ...     while (i <= n):
    ...         yield i
    ...         i += m
    ...
    >>> def every_3_ints_to_10():
    ...     for item in every_m_ints_to(10, 3):
    ...         yield item
    ...
    >>> for gen in make_generators_generator(every_3_ints_to_10):
    ...     print("Next Generator:")
    ...     for item in gen:
    ...         print(item)
    ...
    Next Generator:
    0
    Next Generator:
    0
    3
    Next Generator:
    0
    3
    6
    Next Generator:
    0
    3
    6
    9
    """
    "*** YOUR CODE HERE ***"
    i=1
    while i<=len(list(g())):
       def generator():
           g_lst=list(g())
           g_=iter(g_lst)
           nonlocal i
           k=0
           while k<i:
              yield next(g_)
              k+=1        
       yield generator()
       i+=1
# Hint:
# >>> a=list(range(5))
# >>> b=iter(a)
# >>> b
# <list_iterator object at 0x7f34690c74c0>
# >>> c=list(b)
# >>> c is a
# False

