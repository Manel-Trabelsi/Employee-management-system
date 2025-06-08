class Config(object):
    """
    Common configurations
    """
    SQLALCHEMY_DATABASE_URI = 'mysql://squaduser:squadpass123!@mysql-flexible-server-1.c6hgwqmk0hcw.us-east-1.rds.amazonaws.com:3306/squadmaster'



    # Put any configurations here that are common across all environments


class DevelopmentConfig(Config):
    """
    Development configurations
    """

    DEBUG = True
    # setting this to True activates the debug mode on the app.
    # This allows us to use the Flask debugger in case of an unhandled exception, and
    # also automatically reloads the application when it is updated.
    SQLALCHEMY_ECHO = True
    # setting this to True helps us with debugging by allowing SQLAlchemy to
    # log errors.


class ProductionConfig(Config):
    """
    Production configurations
    """

    DEBUG = False


app_config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig
}
