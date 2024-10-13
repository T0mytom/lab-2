class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post # Permite a todos leer posts
    return unless user.present? # Si el usuario no está autenticado, no hace nada

    can :create, Post # Permite crear posts
    can :create, Comment # Permite crear comentarios
    can [ :edit, :update, :destroy ], Post, user_id: user.id # Permite editar, actualizar y eliminar solo sus propios posts
    can [ :edit, :update, :destroy ], Comment, user_id: user.id # Permite editar, actualizar y eliminar solo sus propios comentarios
  end
end
