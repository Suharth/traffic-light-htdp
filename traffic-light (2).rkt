;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname traffic-light-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Traffic light

;; =================
;; Constants:
(define (CIRCLE type color)
  (circle 50 type color))

(define BBG (rectangle 120 340 "solid" "black")) ;black background

(define x-position 60) ;all circles have the same x position
(define red-position 60) ;y position of red circle
(define yellow-position 170) ;y position of yellow circle
(define green-position 280) ;y position of green circle

(define MTS (place-image (CIRCLE "outline" "green") x-position green-position (place-image (CIRCLE "outline" "yellow") x-position yellow-position (place-image (CIRCLE "outline" "red") x-position red-position BBG))))



;; =================
;; Data definitions:

;; TrafficLight is one of:
;;  -"red"
;;  -"yellow"
;;  -"green"
;; interp. colour of traffic light

#;
(define (fn-for-traffic-light tl)
  (cond [(string=? "red" tl) (...)]
        [(string=? "yellow" tl) (...)]
        [(string=? "green" tl) (...)]))



;; =================
;; Functions:

;; TrafficLight -> TrafficLight
;; start the world with ...
;; 
(define (main tl)
  (big-bang tl                   ; TrafficLight
            (on-tick   tock 1)     ; TrafficLight -> TrafficLight
            (to-draw   render)))   ; TrafficLight -> Image

;; TrafficLight -> TrafficLight
;; produce the next TrafficLight (green after red; yellow after green; red after yellow)
(check-expect (tock "red") "green")
(check-expect (tock "green") "yellow")
(check-expect (tock "yellow") "red")

;(define (tock tl) "") ;stub

(define (tock tl)
  (cond [(string=? "red" tl) "green"]
        [(string=? "yellow" tl) "red"]
        [(string=? "green" tl) "yellow"]))


;; TrafficLight -> Image
;; render the image of the traffic signal with the current TrafficLight made solid
(check-expect (render "red") (place-image (CIRCLE "solid" "red") x-position red-position MTS))

;(define (render tl) (square 0 "solid" "black")) ;stub

(define (render tl)
  (cond [(string=? "red" tl) (place-image (CIRCLE "solid" "red") x-position red-position MTS)]
        [(string=? "yellow" tl) (place-image (CIRCLE "solid" "yellow") x-position yellow-position MTS)]
        [(string=? "green" tl) (place-image (CIRCLE "solid" "green") x-position green-position MTS)]))

(main "red")