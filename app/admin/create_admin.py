from app import create_app, db
from app.models import Employee

app = create_app('development')  # or os.getenv('FLASK_CONFIG')

with app.app_context():
    admin_email = 'admin@manpower.com'
    existing_admin = Employee.query.filter_by(email=admin_email).first()
    if not existing_admin:
        admin = Employee(
            email=admin_email,
            username='admin',
            first_name='Admin',
            last_name='User',
            is_admin=True
        )
        admin.password = "admin"
        db.session.add(admin)
        db.session.commit()
        print('✅ Admin user created.')
    else:
        print('⚠️ Admin user already exists.')
