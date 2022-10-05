const mypageBtn = document.querySelector('.usImfo');
const mypagesearch = document.querySelector('.header-mypage-logout');

mypageBtn.addEventListener('click',() => {
   mypagesearch.classList.toggle('active');
}); 