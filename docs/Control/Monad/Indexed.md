## Module Control.Monad.Indexed

#### `IxMonad`

``` purescript
class (IxApplicative m) <= IxMonad m where
  ibind :: forall m i j k a b. (a -> m j k b) -> m i j a -> m i k b
```

#### `ijoin`

``` purescript
ijoin :: forall m i j k a. (IxMonad m) => m i j (m j k a) -> m i k a
```

#### `(>>>=)`

``` purescript
(>>>=) :: forall m i j k a b. (IxMonad m) => m i j a -> (a -> m j k b) -> m i k b
```

_left-associative / precedence 1_

#### `(=<<<)`

``` purescript
(=<<<) :: forall m i j k a b. (IxMonad m) => (a -> m j k b) -> m i j a -> m i k b
```

_right-associative / precedence 1_

#### `iapIxMonad`

``` purescript
iapIxMonad :: forall m i j k a b. (IxMonad m) => m i j (a -> b) -> m j k a -> m i k b
```

#### `IxMonadZero`

``` purescript
class (IxMonad m) <= IxMonadZero m where
  imzero :: forall i j a. m i j a
```

#### `IxMonadPlus`

``` purescript
class (IxMonadZero m) <= IxMonadPlus m where
  implus :: forall i j a. m i j a -> m i j a -> m i j a
```


