module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

secs :: Planet -> Float
secs Mercury = 0.2408467 * secs Earth
secs Venus = 0.61519726 * secs Earth
secs Earth = 31557600
secs Mars = 1.8808158 * secs Earth
secs Jupiter = 11.862615 * secs Earth
secs Saturn = 29.447498 * secs Earth
secs Uranus = 84.016846 * secs Earth
secs Neptune = 164.79132 * secs Earth

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / secs planet
