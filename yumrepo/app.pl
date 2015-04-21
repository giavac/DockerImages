#!/usr/bin/perl

use Dancer2;

get '/hello/:name' => sub{
        return "Hello there " . params->{name};
    }

    dance;
}
