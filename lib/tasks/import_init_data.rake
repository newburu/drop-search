require "csv"
namespace :import_init_data do
  desc "初期データを登録するタスク"

  task :import, [:start_row] => :environment do |task, args|
    file_path = "db/fixtures/init_data.csv"
    start_row = args.start_row
    CSV.foreach(file_path).with_index do |row, idx|
      next if idx < start_row.to_i
      begin
        ActiveRecord::Base.transaction do
          map_area_name = row[0]
          map_area = MapArea.where(name: map_area_name).first
          if map_area.nil?
            p "MapArea:[#{map_area_name}]がない為、追加します。"
            map_area = MapArea.create!(name: map_area_name)
          end
          mob_name = row[1]
          mob = Mob.where(name: mob_name).first
          if mob.nil?
            p "Mob:[#{mob_name}]がない為、追加します。"
            file = "db/images/mobs/#{mob_name}.jpg"
            mob_image = File.open(file) if File.exist?(file)
            mob = Mob.create!(name: mob_name, image: mob_image)
            row.each_with_index do |col, idx|
              if idx >= 2
                item_name = row[idx]
                if item_name.present?
                  item = Item.where(name: item_name).first
                  if item.nil?
                    p "Item:[#{item_name}]がない為、追加します。"
                    file = "db/images/items/#{item_name}.jpg"
                    item_image = nil # File.open(file) if File.exist?(file)
                    item = Item.create!(name: item_name, item_kind_id: 99, image: item_image)
                  end
                  mob_item = MobItem.where(mob: mob, item: item).first
                  if mob_item.nil?
                    mob_item = MobItem.create!(mob: mob, item: item)
                  end
                end
              end
            end
          end
          mob_map_area = MobMapArea.where(mob: mob, map_area: map_area).first
          if mob_map_area.nil?
            mob_map_area = MobMapArea.create!(mob: mob, map_area: map_area)
          end
        end
      rescue => e
        p e
      end
    end
  end

end
