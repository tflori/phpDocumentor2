<?php

namespace phpDocumentor\TestData\extensions;


class TwigExtension extends \Twig\Extension\AbstractExtension
{
    public function getTests()
    {
        return [
            new \Twig\TwigTest('inNamespace', [$this, 'inNamespace']),
        ];
    }

    public function inNamespace($value, $namespace)
    {
        // trim backslashes from start
        $namespace = trim($namespace, '\\');
        $value = ltrim($value, '\\');
        // ensure backslash at the end
        $namespace .= '\\';
        return str_starts_with($value, $namespace);
    }
}
