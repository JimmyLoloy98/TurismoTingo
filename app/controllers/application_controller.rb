class ApplicationController < ActionController::Base

  #######################################
  #1.por cada accion que venga llama a switch locale
  around_action :switch_locale
  #2.este metodo cambia el idioma de la aplicacion para la peticion
  def switch_locale(&action)
    I18n.with_locale(locale_from_header, &action)
  end

  private
  #3. se le pasa el idioma que tiene el usuario en el navegador, pasando la cabecera
  def locale_from_header
    accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    return unless accept_language # Agregar esta línea para evitar el error si accept_language es nil
    accept_language.scan(/^[a-z]{2}/).first

  end
  ######################################
end
