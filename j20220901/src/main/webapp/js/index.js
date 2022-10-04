const toggleBtn = document.querySelector('.kRVxKH');
const search = document.querySelector('.cymdDn');

toggleBtn.addEventListener('click',() => {
   search.classList.toggle('active');
}); 

const mypageBtn = document.querySelector('.usImfo');
const mypagesearch = document.querySelector('.header-mypage-logout');

mypageBtn.addEventListener('click',() => {
   mypagesearch.classList.toggle('active');
}); 