<?php

namespace Cart\Basket\Exceptions;

use Exception;

class QuantityExceededException extends Exception
{
    protected $message = 'Has añadido el máximo stock para este producto.';
}