class Model < ActiveRecord::Base
  
  plugin / gem
  
  attr_accessible ...
  
  CONSTANT
  
  # ================
  # = Associations =
  # ================
  
  accepts_nested_attributes_for ...
  
  # ==========
  # = Scopes =
  # ==========
  
  # ===============
  # = Validations =
  # ===============
  
  # =============
  # = Callbacks =
  # =============
  
  before_save :set_blup
  before_create
  before_update
  before_destroy
  after...
  
  # =================
  # = State Machine =
  # =================
  
  # =================
  # = Class Methods =
  # =================
  
  # ====================
  # = Instance Methods =
  # ====================
  
protected
  
  # before_save
  def set_blup
    
  end
  
private
  
end