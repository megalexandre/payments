document.addEventListener('DOMContentLoaded', function() {
  // Sidebar Toggle
  const sidebarToggle = document.getElementById('sidebarToggle');
  const sidebar = document.getElementById('sidebar');

  if (sidebarToggle && sidebar) {
    sidebarToggle.addEventListener('click', function() {
      sidebar.classList.toggle('active');
    });

    // Close sidebar when clicking outside on mobile
    document.addEventListener('click', function(event) {
      const isSidebarClick = sidebar.contains(event.target);
      const isSidebarToggleClick = sidebarToggle.contains(event.target);

      if (!isSidebarClick && !isSidebarToggleClick && sidebar.classList.contains('active')) {
        sidebar.classList.remove('active');
      }
    });
  }

  // User Dropdown Menu
  const userMenuToggle = document.getElementById('userMenuToggle');
  const userMenu = document.getElementById('userMenu');

  if (userMenuToggle && userMenu) {
    userMenuToggle.addEventListener('click', function(e) {
      e.stopPropagation();
      userMenu.classList.toggle('active');
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
      const isMenuClick = userMenu.contains(event.target);
      const isToggleClick = userMenuToggle.contains(event.target);

      if (!isMenuClick && !isToggleClick && userMenu.classList.contains('active')) {
        userMenu.classList.remove('active');
      }
    });

    // Close dropdown when clicking a link
    userMenu.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', function() {
        userMenu.classList.remove('active');
      });
    });
  }

  // Active menu item based on current path
  const currentPath = window.location.pathname;
  const navLinks = document.querySelectorAll('.nav-link');

  navLinks.forEach(link => {
    const href = link.getAttribute('href');
    if (currentPath === href || currentPath.startsWith(href + '/')) {
      link.classList.add('active');
    }
  });

  // Close alert messages after 5 seconds (optional, can be removed)
  const alerts = document.querySelectorAll('.alert');
  alerts.forEach(alert => {
    setTimeout(() => {
      if (!alert.parentElement) return; // Check if still in DOM
      const style = alert.style.display;
      if (!style || style !== 'none') {
        alert.style.opacity = '0';
        alert.style.transition = 'opacity 0.3s ease';
        setTimeout(() => {
          alert.style.display = 'none';
        }, 300);
      }
    }, 5000);
  });
});
