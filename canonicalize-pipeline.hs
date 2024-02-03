{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

import Data.Aeson (Value(..))
import Data.Aeson.Lens (_Array, _String, key)
import Data.List (sortOn)
import Data.Vector (Vector, fromList, toList)
import Data.Yaml (decodeEither', encode)
import Lens.Micro ((%~), (^.))
import Options.Applicative
import Options.Applicative.Help.Pretty
import System.Exit (die)

import qualified Data.ByteString.Char8 as BS
import qualified System.Console.Terminal.Size as TS

data ProgramOptions = ProgramOptions
  { optFile :: String
  , optDebug :: Bool
  } deriving (Show)

main :: IO ()
main = do

  cols <- maybe 100 TS.width <$> TS.size

  ProgramOptions {..} <- customExecParser
    ( prefs $ columns cols )
    ( info
      ( helper <*> do
          optFile <- strArgument $
            metavar "FILE" <> value "/dev/stdin" <>
            help "The file to be canonicalized" <> showDefaultWith id
          optDebug <- switch $
            long "debug" <> internal
          pure ProgramOptions{..}
      )
      ( progDesc "Canonicalize a Concourse pipeline file" <>
        footerDoc (Just . fillSep . map pretty . words $ unlines
          [ "Currently, the only transformation is to sort the resources by name."
          ]
        )
      )
    )

  BS.putStr . encode . canonicalize =<< either (die . show) pure . decodeEither' =<< BS.readFile optFile

canonicalize :: Value -> Value
canonicalize = key "resources" . _Array %~ vSortOn (^. key "name" . _String)

vSortOn :: Ord b => (a -> b) -> Vector a -> Vector a
vSortOn f = fromList . sortOn f . toList
