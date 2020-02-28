#lang racket/base
(provide read-isml)

(define (accrete-chars remaining [found '()])
  (let ([next (and (not (eq? remaining '())) (car remaining))])
    (if (char? next)
        (accrete-chars (cdr remaining) (cons next found))
        (values (apply string found)
                remaining))))

(define (accrete-content content [found '()])
  (if (eq? content '()) found
      (if (char? (car content))
          (let-values ([(str remaining) (accrete-chars content)])
            (accrete-content remaining (cons str found)))
          (accrete-content (cdr content) (cons (car content) found)))))

(define (read-isml in [read-controlled read])
  (define control-char (read-char in))
  (define (read-next state reader)
    (define datum (reader in))
    (if (eof-object? datum)
        state
        (if (eq? reader read-char)
            (if (char=? control-char datum)
                (read-next state read-controlled)
                (read-next (cons datum state) reader))
            (read-next (cons datum state) read-char))))
  (if (eof-object? control-char) '()
      (accrete-content (read-next '() read-char))))

(module+ main (read-isml (current-input-port)))
(module+ test
  (require rackunit)
  (check-equal? (read-isml (open-input-string "@ too many markup @(languages)."))
                '(" too many markup " (languages) ".")))
