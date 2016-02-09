# Editable module
module Editable
  def editable?(user)
    return true if user.id == user_id
    false
  end
end
