require "csv"

CSV.foreach('db/fixtures/init_data.csv') do |row|
  begin
    ActiveRecord::Base.transaction do
      map_area_name = row[0]
      map_area = MapArea.where(name: map_area_name).first
      if map_area.nil?
        p "MapArea:[#{map_area_name}]がない為、追加します。"
        map_area = MapArea.create(name: map_area_name)
      end
      mob_name = row[1]
      mob = Mob.where(name: mob_name).first
      if mob.nil?
        p "Mob:[#{mob_name}]がない為、追加します。"
        mob = Mob.create(name: mob_name, map_area: map_area)
      end
      row.each_with_index do |col, idx|
        if idx >= 2
          item_name = row[idx]
          if item_name.present?
            item = Item.where(name: item_name).first
            if item.nil?
              p "Item:[#{item_name}]がない為、追加します。"
              item = Item.create(name: item_name, item_kind_id: 99)
            end
            mob_item = MobItem.where(mob: mob, item: item).first
            if mob_item.nil?
              mob_item = MobItem.create(mob: mob, item: item)
            end
          end
        end
      end
    end
    rescue => e
  end
end