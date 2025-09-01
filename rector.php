<?php

use Rector\Config\RectorConfig;

return RectorConfig::configure()
    ->withSkip([
        './vendor/*',
    ])
    ->withPreparedSets(
        deadCode: true,
        codeQuality: true,
        earlyReturn: true,
    );

