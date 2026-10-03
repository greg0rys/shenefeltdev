class StripeSyncable

    def self.update_price(item:, n_price:)

    end

    def self.create_item(item:)
        return nil if Item.find_by(stripe_price_id: item.stripe_price_id).present?

        StripeSyncJob.create_item(item)
    end


end