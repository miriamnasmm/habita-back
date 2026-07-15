# Be sure to restart your server when you modify this file.

# Permite que la página web (en otro dominio) llame a esta API desde el navegador.
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:5173",              # frontend en desarrollo (vite)
            "http://localhost:4173",              # vite preview
            "https://miriamnasmm.github.io"       # frontend publicado en GitHub Pages

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
