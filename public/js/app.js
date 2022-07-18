const app = {
   init: function () {
      app.addListenerToActions();
   },

   addListenerToActions: function () {
      // We add an event listener to the 'click' on the addListButton
      document.getElementById('addListButton').addEventListener('click', app.showAddListModal);
      // We add an event listener to the 'click' on the close buttons
      document.querySelectorAll('.close').forEach(button => {
         button.addEventListener('click', app.hideModals);
      });
      // We add an event listener to the 'submit' of showAddListModal
      document.querySelector('#addListModal form').addEventListener('submit', app.handleAddListForm);
   },

   handleAddListForm: function (event) {
      event.preventDefault();
      // We acquire the value of the form
      const formData = new FormData(event.target);

      app.makeListInDOM(formData);
      // hide the modal
      app.hideModals();
   },

   makeListInDOM: function (formData) {
      // We get the template & copy it
      const template = document.getElementById('templateList');
      
      const templateList = template.content.cloneNode(true);
      // We change the copy
      templateList.querySelector('h2').textContent = formData.get('name');

      document.querySelector('.listContainer').appendChild(templateList);
   },

   showAddListModal: function () {
      document.getElementById('addListModal').classList.remove('hidden');
   },

   hideModals: function () {
      const modals = document.querySelectorAll('.modal');

      for (const modal of modals) {
         modal.classList.add('hidden');
      }
   }
};

document.addEventListener('DOMContentLoaded', app.init);