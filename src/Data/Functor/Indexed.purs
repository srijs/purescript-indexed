module Data.Functor.Indexed where

class IxFunctor f where
  imap :: forall a b j k. (a -> b) -> f j k a -> f j k b

class (IxPointed m) <= IxApplicative m where
  iap :: forall a b i j k. m i j (a -> b) -> m j k a -> m i k b

class (IxFunctor m) <= IxPointed m where
  ireturn :: forall a i. a -> m i i a

class (IxFunctor w) <= IxCopointed w where
  iextract :: forall a i. w i i a -> a
