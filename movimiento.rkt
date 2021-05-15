(require (lib "graphics.ss" "graphics"))
(open-graphics)
(define v (open-viewport "Movimiento" 800 700))

;Esquina superior izquierda, ancho (x), altura (y), color
;((draw-solid-rectangle v) (make-posn 20 10) 30 30 (make-rgb 0.3 1 0.2))

(define (retroVertical posX posY anch alt r g b)
  (if (and (> posY 0) (> posX 0))
      (begin
        ((draw-solid-rectangle v) (make-posn posX posY) 10 10 (make-rgb r g b))
        (sleep 0.02)
        (retroVertical posX (- posY 20) anch alt r g b)
        )
        (if (> posX 0)
            (retroVertical (- posX 20) 410 anch alt r g b)
            )
      )
  )

(define (vertical posX posY anch alt r g b)
  (if (and (<= posY 410) (< posX 600))
      (begin
        ((draw-solid-rectangle v) (make-posn posX posY) 10 10 (make-rgb r g b))
        (sleep 0.02)
        (vertical posX (+ posY 20) anch alt r g b)
        )
      (if (< posX 600)
          (vertical (+ posX 20) 10 anch alt r g b)
          (retroVertical posX (- posY 20) anch alt (- r 0.3) (- g 1) 1)
          )
      )
)


(define (retroceso posX posY anch alt r g b)
  (if (> posX 0)
      (begin
       ((draw-solid-rectangle v) (make-posn posX posY) 10 10 (make-rgb r g b))
       (sleep 0.02)
       (retroceso (- posX 20) posY anch alt r g b)
       )
      (begin
        (if (> posY 0)
            (retroceso 580 (- posY 20) 10 10 r g b)
            )
        )
      )
  )

(define (movimiento posX posY anch alt r g b)
  (if (< posX 600)
      (begin
        ((draw-solid-rectangle v) (make-posn posX posY) 10 10 (make-rgb r g b))
        (sleep 0.02)
        (movimiento (+ posX 20) posY anch alt 0.3 1 0.2)
        )
      (begin
        (if (< posY 400)
            (movimiento 20 (+ posY 20) 30 30 0.3 1 0.2)
            (begin
              (retroceso (- posX 20) posY anch alt (- r 0.3) (- g 1) 1)
              (display posY)
              (vertical 20 10 anch alt r g b)
              )
            )
        )
      )
  )

(movimiento 20 10 30 30 0.3 1 0.2)


