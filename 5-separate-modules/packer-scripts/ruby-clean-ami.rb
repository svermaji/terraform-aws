# pending to check more on InstanceProfileCredential
require 'aws-sdk'

class DeleteAMIsAndSnapshots

  def initialize
    @client = Aws::EC2::Client.new
    @images_to_deregister = []
    @snaps_to_del = []
  end

  def deleteAMIs
    getAMIsToDel
    puts 'Starting deletion...'

    @images_to_deregister.each do |d|
      puts @client.deregister_image({image_id: d, dry_run: false,})
    end

    @snaps_to_del.each do |s|
      puts @client.delete_snapshot({snapshot_id: s, dry_run: false,})
    end

    puts 'done'
  end

  # Method below will be private method
  # To make static method use self.METHODNAME
  private
  def getAMIsToDel
    #all_images = @client.describe_images(filters: [{name: 'owner-id', values: ['761576524318']}])
    all_images = @client.describe_images(filters: [{name: 'is-public', values: ['false']}])
    puts 'Total images count: ' + all_images.images.length.to_s
    puts 'All images data: ' + (all_images.to_h).to_s
    all_images.images.each do |i|
      @images_to_deregister.push(i.image_id)
      i.block_device_mappings.each do |b|
        @snaps_to_del.push(b.ebs.snapshot_id)
      end
    end


    puts 'Image IDs marked to delete: ' + @images_to_deregister.join(',')
    puts 'Snapshots marked to delete: ' + @snaps_to_del.join(',')
  end

end

DeleteAMIsAndSnapshots.new.deleteAMIs