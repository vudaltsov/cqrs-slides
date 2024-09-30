<?php

#[Transactional]
function checkout(Order $order, Connection $connection): Response
{
    foreach ($order->items as $item) {
        $remainingQuantity = $connection->executeQuery(
            <<<'SQL'
                update product
                set quantity = quantity - :requested_quantity,
                    version = version + 1
                where product_id = :product_id
                returning quantity as remaining_quantity
                SQL,
            [
                'product_id' => $item->productId,
                'requested_quantity' => $item->quantity,
            ],
        )->fetchColumn();

        if ($remainingQuantity < 0) {
            // Мало товара!
        }
    }

    // ...
}
