module Control.Monad.Indexed where

import Data.Functor.Indexed

class (IxApplicative m) <= IxMonad m where
  ibind :: forall m i j k a b. (a -> m j k b) -> m i j a -> m i k b

ijoin :: forall m i j k a. (IxMonad m) => m i j (m j k a) -> m i k a 
ijoin = ibind (\a -> a)

infixr 1 =<<<
infixl 1 >>>=

(>>>=) :: forall m i j k a b. (IxMonad m) => m i j a -> (a -> m j k b) -> m i k b
(>>>=) m k = ibind k m 

(=<<<) :: forall m i j k a b. (IxMonad m) => (a -> m j k b) -> m i j a -> m i k b
(=<<<) = ibind

iapIxMonad :: forall m i j k a b. (IxMonad m) => m i j (a -> b) -> m j k a -> m i k b
iapIxMonad f x = f >>>= \ f' -> x >>>= \x' -> ireturn (f' x')

class (IxMonad m) <= IxMonadZero m where
  imzero :: forall i j a.  m i j a

class (IxMonadZero m) <= IxMonadPlus m where
  implus :: forall i j a. m i j a -> m i j a -> m i j a
