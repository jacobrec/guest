(use-modules (guest test)
             (guest atree))

(define-test (guest atree atree-insert)
  (equal? (atree-insert '() '(a) 5) '((a . 5)))
  (equal? (atree-insert '((b . 6)) '(a) 5) '((a . 5) (b . 6)))
  (equal? (atree-insert '((a . ())) '(a b) 5) '((a  (b . 5))))
  (equal? (atree-insert '((a (c . 6))) '(a b) 5) '((a  (b . 5) (c . 6))))
  (equal? (atree-insert '((a (b))) '(a b c) 5) '((a (b (c . 5)))))
  (equal? (atree-insert '((a (b (e . 6)))) '(a b c) 5) '((a (b (c . 5) (e . 6))))))

(define-test (guest atree atree-ref)
  (equal? (atree-ref '() '(a)) #f)
  ;(equal? (atree-ref '() '(a) #t) #t)) ;TODO fix
  (equal? (atree-ref '((a (b . 5) (c . 6))) '(a b)) 5)
  (equal? (atree-ref '((a (b . 5) (c . 6))) '(a c)) 6)
  (equal? (atree-ref '((a (b . 5) (c . 6))) '(a e)) #f)
  (equal? (atree-ref '((a (b . 5) (c . 6)) (b (c . 3) (d . 4))) '(b c)) 3))
  ;(equal? (atree-ref '((a (b . 5) (c . 6)) (b (c . 3) (d . 4))) '(b e) #t) #t)) TODO

(define-test (guest atree atree-sort)
  (equal? (atree-sort '()) '())
  (equal? (atree-sort '((b (d . 1) (c . 2)) (a (d . 1) (c (f . 1) (e . 2)))))
          '((a (c (e . 2) (f . 1)) (d . 1)) (b (c . 2) (d . 1)))))
