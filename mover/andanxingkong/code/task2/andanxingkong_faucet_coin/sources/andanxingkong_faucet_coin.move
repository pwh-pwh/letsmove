module andanxingkong_faucet_coin::andanxingkong_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct ANDANXINGKONG_FAUCET_COIN has drop {}

    fun init(
        witness: ANDANXINGKONG_FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<ANDANXINGKONG_FAUCET_COIN>(
            witness,
            9,
            b"ADX",
            b"ANDANXINGKONG_FAUCET_COIN",
            b"andanxingkong Faucet Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/149133275"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ANDANXINGKONG_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<ANDANXINGKONG_FAUCET_COIN>,
        coin: Coin<ANDANXINGKONG_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}


