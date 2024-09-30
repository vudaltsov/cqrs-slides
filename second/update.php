<?php

function update(array $post, Connection $connection): Response
{
    $affectedRows = $connection->executeStatement(
        <<<'SQL'
            update product
            set --...
                version = version + 1
            where product_id = :product_id
            and version = :version
            SQL,
        $post,
    );

    if ($affectedRows !== 1) {
        return new Response('Кто-то уже поменял товар!', 409);
    }

    // ...
}
