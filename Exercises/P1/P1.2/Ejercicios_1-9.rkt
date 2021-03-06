;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ejercicios_1-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(check-expect (ancho (rectangle 10 20 "solid" "red")) 10)
(check-expect (alto (rectangle 10 20 "solid" "red")) 20)

(define (ancho imagen) (image-width imagen))
(define (alto imagen) (image-height imagen))

; 1.
(check-expect (sgn2 (- 2 3)) -1)
(check-expect (sgn2 0) 0)
(check-expect (sgn2 6) 1)

(define (sgn2 x)
  (cond [(< x 0) -1]
        [(= x 0) 0]
        [(> x 0) 1]))

; 2.
; Ejercicio 2 Practica 1.1 Seccion 1.3
(check-expect (clasificar-imagen-2 (rectangle 10 20 "solid" "red")) "Flaca")
(check-expect (clasificar-imagen-2 (rectangle 20 20 "solid" "red")) "Cuadrada")
(check-expect (clasificar-imagen-2 (rectangle 20 10 "solid" "red")) "Gorda")

(define (clasificar-imagen-2 imagen)
  (cond [(< (ancho imagen) (alto imagen)) "Flaca"]
        [(= (ancho imagen) (alto imagen)) "Cuadrada"]
        [(> (ancho imagen) (alto imagen)) "Gorda"]))

; Ejercicio 4 Practica 1.1 Seccion 1.3
(check-expect (clasifica-triangulo 60 60 60) "equilatero")
(check-expect (clasifica-triangulo 90 45 45) "isosceles")
(check-expect (clasifica-triangulo 45 60 75) "escaleno")

(define (clasifica-triangulo a1 a2 a3)
  (cond [(= a1 a2 a3) "equilatero"]
        [(or (= a1 a2) (= a1 a3) (= a2 a3)) "isosceles"]
        [else "escaleno"]))

(check-expect (clasifica-triangulo-con-error 45 60 75) "escaleno")
(check-expect (clasifica-triangulo-con-error 90 60 60) "Error")

(define (clasifica-triangulo-con-error a1 a2 a3)
  (if (= (+ a1 a2 a3) 180)
      (clasifica-triangulo a1 a2 a3)
      "Error"))

; Ejercicio 6 Practica 1.1 Seccion 1.3
(define PC 60)
(define PL 8)

(define LIMITE-CUADERNOS 4)
(define DESCUENTO-CUADERNOS 0.1)

(define LIMITE-LAPICES 5)
(define DESCUENTO-LAPICES 0.15)

(define LIMITE-TOTAL 10)
(define DESCUENTO-TOTAL 0.18)

(check-expect (monto-a-pagar 1 0) 60)
(check-expect (monto-a-pagar 5 5) 249.28) 

(define (monto-a-pagar c l)
 (* (+ (monto-cuadernos c)
       (monto-lapices l))
    (cond [(>= (+ c l) LIMITE-TOTAL) (- 1 DESCUENTO-TOTAL)]
          [else 1])))

(check-expect (monto-cuadernos 1) 60)
(check-expect (monto-cuadernos 5) 270)

(define (monto-cuadernos c)
  (* c PC (cond [(>= c LIMITE-CUADERNOS) (- 1 DESCUENTO-CUADERNOS) ]
                [else 1])))

(check-expect (monto-lapices 1) 8)
(check-expect (monto-lapices 5) 34)

(define (monto-lapices l)
  (* l PL (cond [(>= l LIMITE-LAPICES) (- 1 DESCUENTO-LAPICES)]
                [else 1])))

; Ejercicio 7 Practica 1.1 Seccion 1.3
(check-expect (pitagorica? 5 3 4) #true)
(check-expect (pitagorica? 4 3 5) #true)

(define (pitagorica? x y z)
  (cond [(= (sqr x) (+ (sqr y) (sqr z))) #true]
        [(= (sqr y) (+ (sqr x) (sqr z))) #true]
        [(= (sqr z) (+ (sqr x) (sqr y))) #true]
        [else #false]))
        
; 3.       
(check-expect (pitagorica? 3 5 6) #false)
(check-expect (pitagorica? 3 5 4) #true)

; 4.
(check-expect (clasificar-imagen-4 (rectangle 10 10 "solid" "red")) "Cuadrada")
(check-expect (clasificar-imagen-4 (rectangle 30 10 "solid" "red")) "Muy Gorda")
(check-expect (clasificar-imagen-4 (rectangle 20 10 "solid" "red")) "Gorda")
(check-expect (clasificar-imagen-4 (rectangle 10 30 "solid" "red")) "Muy flaca")
(check-expect (clasificar-imagen-4 (rectangle 10 20 "solid" "red")) "Flaca")

(define (clasificar-imagen-4 imagen)
  (cond [(< (* 2 (alto imagen)) (ancho imagen)) "Muy Gorda"]
        [(> (alto imagen) (* 2 (ancho imagen))) "Muy flaca"]
        [else (clasificar-imagen-2 imagen)]))

; 5.
(check-expect (clasificar -3) "No Olvidar Bufanda (NOB)")
(check-expect (clasificar 12) "Frío (F)")
(check-expect (clasificar 15) "Agradable (A)")
(check-expect (clasificar 28) "Realmente Caluroso (RC)")

(define (clasificar t)
  (cond [(< t 0) "No Olvidar Bufanda (NOB)"]
        [(and (> t 0) (< t 15)) "Frío (F)"]
        [(and (>= t 15) (<= t 25)) "Agradable (A)"]
        [(> t 25) "Realmente Caluroso (RC)"]))

; 6.
(check-expect (sgn3 -3) -1)
(check-expect (sgn3 "123") 1)

(define (sgn3 x)
  (cond [(number? x) (sgn2 x)]
        [(string? x) (sgn2 (string->number x))]))

(check-expect (sgn4 5) 1)
(check-expect (sgn4 #true) 1)
(check-expect (sgn4 #false) 0)

(define (sgn4 x)
  (cond [(or (number? x) (string? x)) (sgn3-v2 x)]
        [(boolean? x) (if x 1 0)]))

; 7.
(check-expect (sgn5 #true) 1)
(check-expect (sgn5 (rectangle 10 10 "solid" "red")) 0)

(define (sgn5 x)
  (cond [(or (number? x) (string? x) (boolean? x)) (sgn4 x)]
        [(image? x) (sgn-imagen x)]))

(check-expect (sgn-imagen (rectangle 10 10 "solid" "red")) 0)
(check-expect (sgn-imagen (rectangle 20 10 "solid" "red")) 1)
(check-expect (sgn-imagen (rectangle 10 20 "solid" "red")) -1)

(define (sgn-imagen imagen)
  (cond [(= (alto imagen) (ancho imagen)) 0]
        [(> (alto imagen) (ancho imagen)) -1]
        [else 1]))

; 8.
(check-expect (sgn6 2) 1)
(check-expect (sgn6 #\a) "Clase no soportada por la función")

(define MSJ-ERROR-CLASE-NO-SOPORTADA "Clase no soportada por la función")

(define (sgn6 x)
  (cond [(or (number? x) (string? x)(boolean? x) (image? x)) (sgn5 x)]
        [else MSJ-ERROR-CLASE-NO-SOPORTADA]))

; 9.
(check-expect (sgn3-v2 1) 1)
(check-expect (sgn3-v2 "12") 1)
(check-expect (sgn3-v2 "123a") "La cadena no se puede convertir a un número")

(define MSJ-ERROR-STRING-NO-NUM "La cadena no se puede convertir a un número")

(define (sgn3-v2 x)
  (cond [(number? x) (sgn2 x)]
        [(string? x) (if (number? (string->number x))
                         (sgn2 (string->number x))
                          MSJ-ERROR-STRING-NO-NUM)]))
