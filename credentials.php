<?php

return [
    'twitter_consumer_key' => $_ENV['TWITTER_APP_CONSUMER_KEY'],
    'twitter_consumer_secret' => $_ENV['TWITTER_APP_CONSUMER_SECRET'],
    'twitter_user_token' => $_ENV['TWITTER_USER_ACCESS_TOKEN'],
    'twitter_token_secret' => $_ENV['TWITTER_USER_ACCESS_TOKEN_SECRET'],

    'github_api_bearer' => $_ENV['GITHUB_API_BEARER_TOKEN'],

    'default_template' => 'app/Resources/templates/cover_sponsors2.json',
];
