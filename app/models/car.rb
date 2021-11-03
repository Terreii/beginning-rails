class Car
  include ActiveModel::AttributeAssignment
  extend ActiveModel::Callbacks
  include ActiveModel::Dirty

  attr_accessor :make, :model, :year, :color

  define_attribute_methods :color
  define_model_callbacks :paint

  before_paint :keep_it_waxed
  after_paint :notify_dmv, if: :color_changed?

  def initialize(attributes = {})
    assign_attributes(attributes) if attributes

    super()
  end

  def paint(new_color)
    run_callbacks :paint do
      Rails.logger.info "Painting the car #{new_color}"
      color_will_change! if color != new_color
      self.color = new_color
    end
  end

  private

    def keep_it_waxed
      Rails.logger.warn "Be sure to keep your new paint job waxed!"
    end

    def notify_dmv
      Rails.logger.warn "Be sure to notify the DMV about this color change!"
      changes_applied
    end
end
