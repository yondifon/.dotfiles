<?php

use Rector\Config\RectorConfig;

return RectorConfig::configure()
    ->withPaths([
        // Add your paths here
    ])
    ->withSkip([
        __DIR__.'/vendor/*',
    ])
    ->withPhpSets(php84: true)
    ->withPreparedSets(
        deadCode: true,
        // codeQuality: true,
        earlyReturn: true,
    );
