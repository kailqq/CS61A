(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)


(define (sign num)
  (if (zero? num)
  0
  (if (< num 0)
  -1
  1
  )
  )
)


(define (square x) (* x x))

(define (pow x y)
 (if (= 1 x) 1
  (if (= y 1 ) x
  (if (even? y)
   (* (pow  x (/ y 2)) (pow  x (/ y 2)) ) 
   (*  (pow x (- y 1))   x)
   )
  )
 )
)


(define (unique s)
  (if (null? s) nil
   (cons (car s) (unique (filter (lambda(x) (not (equal? x (car s))) ) (cdr s)))
   )
  )
)


(define (replicate x n)
  (define (tail-rep  n s)
  (if (= 0 n)
  s
  (tail-rep (- n 1) (cons x s))
  )
  )
  (tail-rep n nil)
  )


(define (accumulate combiner start n term)
  (if (= n 0)
  start
  (accumulate combiner (combiner start (term n)) (- n 1) term)
  ) 
)


(define (accumulate-tail combiner start n term)
  
  (if (= n 0)
  start
  (accumulate-tail combiner (combiner start (term n)) (- n 1) term)
  ) 
)

(define (map expr lst)
  (if (null? lst) nil
  (cons (expr (car lst)) (map expr (cdr lst)))
  )
)

(define-macro (list-of map-expr for var in lst if filter-expr)
  (list 'map (list 'lambda(list var) map-expr) (list 'filter (list 'lambda(list var) filter-expr) lst))
)
#hint every ()should contains a list with the key word a quote