## Module Control.Comonad.Indexed

#### `IxComonad`

``` purescript
class (IxCopointed w) <= IxComonad w where
  iextend :: forall i j k a b. (w j k a -> b) -> w i k a -> w i j b
```

#### `iduplicate`

``` purescript
iduplicate :: forall w i j k a. (IxComonad w) => w i k a -> w i j (w j k a)
```


