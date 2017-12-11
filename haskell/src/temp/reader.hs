import Control.Monad.Reader

greeter :: Reader String String
greeter = do
    name <- ask
    return ("hello, " ++ name ++ "!")
