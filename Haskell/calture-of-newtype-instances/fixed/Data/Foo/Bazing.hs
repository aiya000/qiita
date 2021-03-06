{-# LANGUAGE DerivingVia #-}

module Data.Foo.Bazing where

import Data.Foo

newtype Bazing = Bazing
  { unBazing :: Foo
  } deriving (Eq) via Foo  -- Fooのうち必要な性質を、Bazingに抜き出す

-- Bazを優先する実装
instance Semigroup Bazing where
  (Bazing Baz) <> _ = Bazing Baz
  _ <> (Bazing Baz) = Bazing Baz
  _ <> _            = Bazing Bar

-- importしたい関数
veryVeryBenriBazing :: Foo -> Foo
veryVeryBenriBazing _ = Baz
