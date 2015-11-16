module Control.Comonad.Indexed where

import Data.Functor.Indexed

class (IxCopointed w) <= IxComonad w where
  iextend :: forall i j k a b. (w j k a -> b) -> w i k a -> w i j b

iduplicate :: forall w i j k a. (IxComonad w) => w i k a -> w i j (w j k a)
iduplicate = iextend (\a -> a)

