import os
from app import create_app

# Définit une valeur par défaut si FLASK_CONFIG n'est pas définie
config_name = os.getenv('FLASK_CONFIG', 'development')

# Crée l'application Flask avec la configuration appropriée
app = create_app(config_name)

if __name__ == '__main__':
    # Active le mode debug automatiquement en mode développement
    debug_mode = config_name == 'development'
    app.run(debug=debug_mode)
