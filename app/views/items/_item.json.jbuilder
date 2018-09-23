json.extract! item, :id, :item_kind_id, :name, :image, :created_at, :updated_at
json.url item_url(item, format: :json)
