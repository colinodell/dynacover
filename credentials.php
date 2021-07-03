<?php

return [
    'twitter_consumer_key' => getenv('TWITTER_APP_CONSUMER_KEY'),
    'twitter_consumer_secret' => getenv('TWITTER_APP_CONSUMER_SECRET'),
    'twitter_user_token' => getenv('TWITTER_USER_ACCESS_TOKEN'),
    'twitter_token_secret' => getenv('TWITTER_USER_ACCESS_TOKEN_SECRET'),

    'github_api_bearer' => getenv('GITHUB_API_BEARER_TOKEN'),

    'default_template' => 'app/Resources/templates/cover_sponsors2.json',
];
