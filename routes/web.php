<?php


use App\Http\Controllers\Advocate\SocialPostCommentsController;
use App\Http\Controllers\Front\shop\CartController;
use App\Http\Controllers\Front\shop\CartWishListController;
use App\Http\Controllers\Front\shop\CompareProductController;
use App\Http\Controllers\Front\shop\FilterProductsController;
use App\Http\Controllers\Front\shop\ProductDetailController;
use App\Http\Controllers\Message\ConversationMessageController;
use App\Http\Controllers\Message\MessengerController;

use App\Http\Controllers\Notification\NotificationController;
use App\Http\Controllers\Social\SocialController;
use App\Http\Controllers\Social\SocialStepController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/








/*
|--------------------------------------------------------------------------
| FRONT END ROUTES
|--------------------------------------------------------------------------
|
|Front End Routes for Other Web Pages and Methods
|
*/

Route::get('order/detail/{id}', 'HomeController@orderDetail')->name('shop.order.detail')->middleware('auth');
Route::post('/newsletter/email/save','NewsLetterEmailController@save')->name('newsletter.save');
Route::get('/newsletter/email/list','NewsLetterEmailController@index')->name('newsletter.email.list')->middleware('admin');

Route::namespace('Front')->middleware('visitlog')->group(function () {
    Route::get('/', 'FrontEndController@index')->name('index');
    Route::get('about-us', 'FrontEndController@aboutUs')->name('about.us');
    Route::get('our-mission', 'FrontEndController@ourMission')->name('our.mission');
    Route::get('explore-homeopathy', 'FrontEndController@exploreHomeopathy')->name('explore.homeopathy');
    Route::get('store', 'FrontEndController@store')->name('store');
    Route::get('privacy-policy', 'FrontEndController@privacyPolicy')->name('privacy.policy');
    Route::get('terms', 'FrontEndController@terms')->name('terms');
    Route::get('contact-us', 'FrontEndController@contactUs')->name('contact.us');
    Route::get('advocates', 'FrontEndController@advocates')->name('advocates');
    Route::get('profile/consultant', 'FrontEndController@consultant')->name('consultant');
    Route::get('faqs', 'FrontEndController@faqs')->name('faqs');


    Route::get('how-to-prompt', 'FrontEndController@howToPrompt')->name('how.prompt');


    Route::get('homeopath', 'HomeopathController@findHomeopath')->name('find.homeopath');
    Route::get('member/homeopath/{user_name?}', 'HomeopathController@profileHomeopath')->name('profile.homeopath');

    Route::get('prescription/{id}', 'FrontEndController@prescription')->name('prescription');


    Route::get('service/review', 'ReviewController@serviceReview')->name('service.review');
    Route::post('submit/service/review', 'ReviewController@submitServiceReview')->name('submit.service.review');


    Route::name('shop.')->prefix('shop')->namespace('shop')->group(function () {


        Route::get('/', 'ShopController@index')->name('index');

        Route::get('my/cart', 'CartController@myCart')->name('my.cart');


        Route::get('checkout', 'CartController@checkout')->name('checkout')->middleware('auth');;
        Route::post('make/checkout', 'CheckoutController@makeCheckout')->name('make.checkout');


        Route::get('product/{id}/{slug}', 'ProductDetailController@productDetail')->name('product.detail');

        Route::get('payment/success', 'CheckoutController@shopPaymentSuccess')->name('payment.success');


        Route::get('wish/list/add/{id}', 'CartWishListController@addToList')->name('wish.list.add');

        Route::get('/compare/product', 'CompareProductController@getCompareProduct')->name('compare.product');

        Route::get('cart/add/{id}', 'CartController@add')->name('cart.add');
        Route::get('cart/update/{rowid}', 'CartController@updateItem')->name('cart.update');
        Route::get('cart/delete/{rowid}', 'CartController@destroyItem')->name('cart.destroy');


        Route::get('cart/remove/item/', 'CartController@removeItem')->name('cart.remove.item');
        Route::get('cart/update/item/quantity', 'CartController@updateItemQuantity')->name('cart.update.item.quantity');
        Route::get('cart/get/quantity', 'CartController@getCartQuantity')->name('cart.get.quantity');


        Route::get('product/filter', 'FilterProductsController@index')->name('product.filter');
        Route::get('category/{slug}', 'FilterProductsController@categoryFilter')->name('product.category');
        Route::get('brand/{slug}', 'FilterProductsController@brandFilter')->name('product.brand');


    });

    Route::get('articles', 'ArticleController@articles')->name('articles');
    Route::get('article/{uuid}/{slug}', 'ArticleController@articleDetail')->name('article.detail');






});
    Route::get('donations', 'Front\DonationController@index')->name('donations.index');

    Route::post('/submit/contact',  'Front\InquiryController@submitInquiry')->name('submit.inquiry');

    Route::get('join/group/{id}', 'Social\GroupController@joinGroupViaLink')->name('join.group.via.link');




/*
|--------------------------------------------------------------------------
| SIMPLE GUEST ROUTES
|--------------------------------------------------------------------------
|
|Simple Guest Routes for Web Pages and Methods
|
*/

    Route::get('/service/booking/{id}', 'BookingController@booking')->name('service.booking');
    Route::get('/service/slot', 'BookingController@getServiceSlot')->name('get.service.slot');
    Route::get('/check/service/slot', 'BookingController@checkSlotAvailablity')->name('check.service.slot');
    Route::get('/include/service/prompt', 'BookingController@includeServicePrompt')->name('include.service.prompt');







Route::name('community.')->prefix('community')->namespace('Community')->group(function () {
    Route::get('/', 'CommunityController@index')->name('index');
    Route::get('/discussion/{id}/{slug}', 'CommunityController@show')->name('show');


    Route::get('/category/{slug}', 'CommunityController@searchCategory')->name('search.category');

    Route::post('create', 'CommunityController@create')->name('create');
    Route::post('update', 'CommunityController@update')->name('update');
    Route::get('remove/{id}', 'CommunityController@remove')->name('remove');


    Route::post('comment/create', 'CommentController@create')->name('comment.create');
    Route::get('comment/remove/{id}', 'CommentController@remove')->name('comment.remove');

    Route::get('forum/react/update', 'ReactionController@forumReactUpdate')->name('forum.react.update');

});
















/*
|--------------------------------------------------------------------------
| BASIC AUTH PROTECTED ROUTES
|--------------------------------------------------------------------------
|
|BAsic & Simple AUTH Protected Routes for web pages
|
*/


Route::middleware(['auth', 'status','verified'])->group(function () {
    Route::get('/dashboard', 'HomeController@redirectDashboard')->name('redirect.dashboard');

    Route::post('/make/checkout', 'PaymentController@makeCheckout')->name('make.checkout');

    Route::get('paypal/payment/success', 'PaymentController@paypalPaymentSuccess')->name('paypal.payment.success');


    Route::get('search_user', 'HomeController@searchUser')->name('search_user');
    Route::post('profile/{profileId}/follow', 'HomeController@followUser')->name('user.follow');
    Route::post('/{profileId}/unfollow', 'HomeController@unFollowUser')->name('user.unfollow');


    Route::post('donate/amount', 'Front\DonationController@donateAmount')->name('donate.amount');
    Route::get('donation/payment/success', 'Front\DonationController@donationPaymentSuccess')->name('donation.payment.success');
    Route::get('donation/cancel/{id?}', 'Front\DonationController@donationCancel')->name('donation.cancel');

    Route::post('/link/zoom', 'ZoomIntegrationController@linkZoom')->name('link.zoom');
    Route::post('/zoom', 'ZoomIntegrationController@meeting_create')->name('zoom');
    Route::post('service/zoom/meeting', 'ZoomIntegrationController@serviceMeeting_create')->name('service.zoom.meeting');
    Route::get('/remove/zoom/account', 'ZoomIntegrationController@removeZoomAccount')->name('remove.zoom.account');

    Route::get('/get-more-badges', 'Front\BadgeController@getMoreBadges')->name('get.more.badges');
    Route::post('/get-more-badges', 'Front\BadgeController@getMoreBadgesPost')->name('get.more.badges.post');

    Route::post('/send/group/invitation/mail', 'Social\GroupController@sendGroupInvitationMail')->name('send.group.invitation');

});










        /*
        |--------------------------------------------------------------------------
        | SOCIAL NETWORK PROTECTED ROUTES
        |--------------------------------------------------------------------------
        |
        |Social Network Protected Routes
        |
        */



    Route::name('social.')->prefix('social-network')->namespace('Social')->middleware(['auth', 'status'])->group(function () {

        Route::get('/', 'SocialController@index')->name('index');

        Route::get('/post/{id}', 'SocialController@showSocialPost')->name('show.post');

        Route::middleware('socially.completed')->group(function () {
            Route::get('/', 'SocialController@index')->name('index');
        });


        Route::get('/load/album/{id}', 'SocialStepController@loadAlbum')->name('load.album');


        // album routes
        Route::get('/delete/album/{id}', 'SocialController@deleteAlbum')->name('album.delete');
        Route::get('/get/model/body', 'SocialController@getModelBody')->name('get.model.body');

        Route::post('/create/new/album','SocialController@createNewAlbum')->name('create.new.album');
        Route::post('/upload/album/photo','SocialController@uploadAlbumPhoto')->name('upload.album.photo');


        Route::get('/load/homeopath', 'SocialStepController@loadHomeopath')->name('load.homeopath');
        Route::get('/send/invitation', 'SocialStepController@sendInvitation')->name('send.invitation');
        Route::post('/complete/step', 'SocialStepController@completeStep')->name('complete.step');


        Route::get('/render/page', 'SocialNetworkPageController@renderPage')->name('render.page');
        Route::post('/about/update', 'SocialNetworkPageController@aboutUpdate')->name('about.update');
        Route::post('/cover/update', 'SocialNetworkPageController@coverUpdate')->name('cover.update');


        Route::get('/connect/disconnect', 'SocialNetworkPageController@connectDisconnect')->name('connect.disconnect');
        Route::get('/group/follow/unfollow', 'SocialNetworkPageController@groupFollowUnfollow')->name('group.follow.unfollow');
        Route::get('/group/request/{action}/{group_id}/{user_id}', 'SocialNetworkPageController@groupRequestAction')->name('group.request.action');


        Route::get('/social-network', [SocialController::class,'index'])->name('social.network');
        Route::get('social-post/delete/{id}', [SocialController::class,'deltePost'])->name('post.delete');
        Route::get('social-post/edit/{id}', [SocialController::class,'editPost'])->name('post.edit');
        Route::post('save-post', [SocialController::class,'savePost'])->name('save.post');
        Route::get('reaction/{id}', [SocialController::class,'reaction'])->name('reaction');
        Route::get('post/status/change/{id}', [SocialController::class,'changePostStatus'])->name('post.change.status');




        Route::post('save-comment', [SocialPostCommentsController::class,'save_comment'])->name('save.comment');
        Route::get('delete/comment/{id}', [SocialPostCommentsController::class,'deleteComment'])->name('comment.delete');
        Route::post('get', [SocialPostCommentsController::class,'save_comment'])->name('save-comment');



        Route::name('group.')->prefix('group')->group(function () {

            Route::post('/create', 'GroupController@groupCreate')->name('create');
            Route::post('/update', 'GroupController@groupUpdate')->name('update');
            Route::get('/delete/{id}', 'GroupController@groupDelete')->name('delete');

        });




        Route::get('/search/name', 'SocialNetworkPageController@searchName')->name('search.name');

        Route::get('/connection/profile/{id}/{name?}', 'SocialNetworkPageController@connectionProfile')->name('connection.profile');
        Route::get('/group/detail/{id}', 'SocialNetworkPageController@groupDetail')->name('group.detail');
        Route::post('/connection/send/message/{id}', [ConversationMessageController::class,'saveMessage'])->name('connection.send.message');




        Route::get('/check/user/following/tag', 'SocialTagController@checkUserFollowingTag')->name('check.user.follwing.tags');
        Route::get('/tag/follow/unfollow', 'SocialTagController@tagFollowUnfollow')->name('tag.follow.unfollow');




        Route::get('/event/interested', 'SocialEventController@eventInterested')->name('event.interested');
        Route::post('/event/request', 'SocialEventController@eventRequest')->name('event.request');

        Route::post('report/user', 'SocialEventController@reportUser')->name('report.user');

    });





















/*
|--------------------------------------------------------------------------
| USER ROUTES
|--------------------------------------------------------------------------
|
|USER Routes for Web Pages, Methods
|
*/


Route::name('user.')->prefix('user')->namespace('User')->middleware(['status', 'user','verified'])->group(function () {


    Route::get('/dashboard', 'UserProfileController@dashboard')->name('dashboard');

    Route::get('profile', 'UserProfileController@profile')->name('profile');
    Route::post('update-profile', 'UserProfileController@updateProfile')->name('update.profile');
    Route::post('update-password', 'UserProfileController@updatePassword')->name('update.password');

});







/*
|--------------------------------------------------------------------------
| HOMEOPATH ROUTES
|--------------------------------------------------------------------------
|
|HOMEOPATH Routes for Web Pages, Methods
|
*/

Route::name('homeopath.')->prefix('homeopath')->namespace('Homeopath')->middleware(['status', 'homeopath','verified'])->group(function () {

    Route::get('/dashboard', 'HomeopathProfileController@dashboard')->name('dashboard');
    Route::post('complete-profile', 'HomeopathProfileController@completeProfile')->name('complete.profile');
    Route::post('complete-profile-update', 'HomeopathProfileController@completeProfileUpdate')->name('complete.profile.update');



    #CHECK HOMEOPATH PROFILE ACTIVE MIDDLEWRE
    Route::middleware('homeopath.profile.active')->group(function () {

        Route::post('/badge/status/change', 'HomeopathProfileController@homeopathBadgeStatusUpdate')->name('badge.status.change');

        Route::get('profile', 'HomeopathProfileController@profile')->name('profile');
        
        Route::post('update-profile', 'HomeopathProfileController@updateProfile')->name('update.profile');
        Route::post('update-password', 'HomeopathProfileController@updatePassword')->name('update.password');

        Route::name('services.')->prefix('services')->group(function () {
            Route::get('/', 'ServicesController@index')->name('index');
            Route::get('/detail/{id}', 'ServicesController@detail')->name('detail');
            Route::post('/create', 'ServicesController@create')->name('create');
            Route::post('/update', 'ServicesController@update')->name('update');
            Route::get('/update/status/{id}/{status}', 'ServicesController@updateStatus')->name('update.status');
            Route::get('/delete/{id}', 'ServicesController@delete')->name('delete');


            Route::get('/book/appointment/{id}', 'ServicesController@bookAppointment')->name('book.appointment');
            Route::post('/create/appointment', 'ServicesController@createAppointment')->name('appointment.create');
            Route::post('service/page/image/save', 'ServicesController@servicesProfileImage')->name('page.image.save');





        });

        Route::prefix('resources')->name('resources.')->group(function () {
            Route::get('/', 'ResourcesController@index')->name('index');
            Route::post('/create', 'ResourcesController@create')->name('create');
            Route::post('/update', 'ResourcesController@update')->name('update');
            Route::get('/delete/{id}', 'ResourcesController@delete')->name('delete');
        });

        Route::get('/finance', 'FinanceController@index')->name('finance.index');


        Route::get('/bookings/update/status', 'ServiceBookingController@updateStatus')->name('bookings.update.status');
        Route::post('/booking/complete', 'ServiceBookingController@bookingComplete')->name('bookings.complete');

        Route::name('settings.')->prefix('settings')->group(function () {
            Route::get('/', 'SettingsController@index')->name('index');
            Route::post('/update/images', 'SettingsController@updateImages')->name('update.images');
            Route::post('/update/files', 'SettingsController@updateFiles')->name('update.files');
            Route::post('/homeopath/profile/service/timeIntervel', 'SettingsController@setHomeopathServiceTime')->name('service.time');
        });

        Route::name('documents.')->prefix('documents')->group(function () {
            Route::get('/', 'DocumentController@index')->name('index');
            Route::post('/create', 'DocumentController@create')->name('create');
            Route::post('/edit', 'DocumentController@edit')->name('edit');
        });

        Route::get('/customers', 'CustomerController@index')->name('customers.index');
        Route::get('/appointments', 'ServiceBookingController@appointments')->name('appointments.index');
        Route::get('/appointments/schedule', 'ServiceBookingController@appointmentsSchedule')->name('appointments.schedule');
        Route::get('/appointments/calendar', 'ServiceBookingController@appointmentsCalendar')->name('appointments.calendar');


        Route::name('appointments.')->prefix('appointments')->group(function () {
            Route::get('/close/day', 'AppointmentScheduleController@closeDay')->name('close.day');
            Route::get('/save/timetable', 'AppointmentScheduleController@saveTimeTable')->name('save.timetable');
            Route::post('/set/specific/day', 'AppointmentScheduleController@setSpecificDay')->name('set.specific.day');
            Route::post('/set/all/day', 'AppointmentScheduleController@setAllDay')->name('set.all.day');

            Route::post('/update/holiday', 'AppointmentScheduleController@updateHoliday')->name('update.holiday');
            Route::get('/remove/holiday/{id}', 'AppointmentScheduleController@removeHoliday')->name('remove.holiday');




        });



    });






});










/*
|--------------------------------------------------------------------------
| ADVOCACY ROUTES
|--------------------------------------------------------------------------
|
|ADVOCACY Routes for Web Pages, Registration, Methods
|
*/



Route::name('advocate.')->prefix('advocate')->namespace('Advocate')->middleware(['status', 'advocate','verified'])->group(function () {

    Route::get('/dashboard', 'AdvocateProfileController@dashboard')->name('dashboard');
    Route::get('profile', 'AdvocateProfileController@profile')->name('profile');
    Route::post('update-profile', 'AdvocateProfileController@updateProfile')->name('update.profile');
    Route::post('update/other-profile', 'AdvocateProfileController@updateOtherProfile')->name('update.other.profile');
    Route::post('update-password', 'AdvocateProfileController@updatePassword')->name('update.password');

    Route::resources([
        'articles'         => 'ArticleController',
    ]);



    Route::name('events.')->prefix('events')->group(function () {

        Route::get('/', 'EventController@index')->name('index');
        Route::get('/create', 'EventController@create')->name('create');
        Route::post('/store', 'EventController@store')->name('store');
        Route::get('/show/{id}', 'EventController@show')->name('show');
        Route::get('/remove/{id}', 'EventController@remove')->name('remove');
        Route::get('/close/{id}', 'EventController@close')->name('close');
        Route::get('/edit/{id}', 'EventController@edit')->name('edit');
        Route::post('/update/{id}', 'EventController@update')->name('update');

        Route::get('/request/status', 'EventController@requestStatus')->name('request.status');


    });





});






Route::post('save/message',[ConversationMessageController::class,'saveMessage'])->name('save.messsage');
Route::get('get/message',[ConversationMessageController::class,'getchat'])->name('get.chat');


Route::get('getMessage/{id}',[ConversationMessageController::class,'getchat'])->name('get.message');


Route::get('see/notification/{id}',[NotificationController::class,'seeNotification'])->name('see.notification');
Route::get('get/all/notification',[NotificationController::class,'getNotifications'])->name('get.all.notification');













/*
|--------------------------------------------------------------------------
| ADMIN ROUTES
|--------------------------------------------------------------------------
|
|Super admin, admin, Sub admin Routes for site Management
|
*/


Route::get('admin/login', 'Admin\AdminLoginController@adminIndexLogin')->name('admin.index.login');
Route::post('admin/login', 'Admin\AdminLoginController@AdminAttemptLogin')->name('admin.attempt.login');


    Route::prefix('admin')->name('admin.')->middleware(['status', 'admin'])->namespace('Admin')->group(function() {

    Route::get('/dashboard', 'AdminLoginController@dashboard')->name('dashboard');
    Route::get('profile', 'AdminProfileController@profile')->name('profile');
    Route::post('update-profile', 'AdminProfileController@updateProfile')->name('update.profile');

    Route::get('refund/index', 'PaymentRefundController@index')->name('refund.index');
    Route::post('refund/amount', 'PaymentRefundController@refund')->name('refund.amount');


    Route::name('setting.')->prefix('settings')->group(function () {

        Route::get('/', 'SettingController@index')->name('index');

        Route::view('/general', 'admin.setting.pages.general')->name('general');
        Route::view('/toastr', 'admin.setting.pages.toastr')->name('toastr');
        Route::view('/homepage', 'admin.setting.pages.homepage')->name('homepage');
        Route::view('/terms', 'admin.setting.pages.terms')->name('terms');
        Route::view('/privacy', 'admin.setting.pages.privacy')->name('privacy');
        Route::view('/our-mission', 'admin.setting.pages.mission')->name('mission');
        Route::view('/about-us', 'admin.setting.pages.about')->name('about');
        Route::view('/advocates', 'admin.setting.pages.advocates')->name('advocates');
        Route::view('/badges', 'admin.setting.pages.badges')->name('badges');
        Route::view('/faq', 'admin.faq.list')->name('faq');



        Route::post('update', 'SettingController@update')->name('update');


        Route::name('ads.')->prefix('ads')->group(function () {
            Route::get('/', 'AdsSettingController@index')->name('index');
            Route::get('/status/{id}', 'AdsSettingController@changeStatus')->name('status');
            Route::post('/save', 'AdsSettingController@save')->name('save');
            Route::get('/delete/{id}', 'AdsSettingController@delete')->name('delete');
        });

     });





    Route::resources([
        'roles'     => 'RoleController',
        'teams'     => 'TeamController',
        'blogs'         => 'BlogController',
    ]);

    Route::get('roles/delete/{id?}', 'RoleController@delete')->name('roles.delete');
    Route::get('teams/remove/{id?}', 'TeamController@remove')->name('teams.remove');




 Route::name('faq.')->prefix('faq')->group(function () {

        Route::get('/list', 'FAQController@index')->name('index');
        Route::get('/create', 'FAQController@create')->name('create');
        Route::post('/save', 'FAQController@save')->name('save');
        Route::get('/edit/{id}', 'FAQController@edit')->name('edit');
        Route::get('/delete/{id}', 'FAQController@delete')->name('delete');



    });




    Route::name('homeopath.')->prefix('homeopath')->group(function () {

        Route::get('/library', 'ExploreHomeopathController@index')->name('index');

        Route::post('/category/create', 'ExploreHomeopathController@categoryCreate')->name('category.create');
        Route::post('/category/update', 'ExploreHomeopathController@categoryUpdate')->name('category.update');
        Route::get('/category/remove/{id}', 'ExploreHomeopathController@categoryRemove')->name('category.remove');

        Route::post('/library/create', 'ExploreHomeopathController@libraryCreate')->name('library.create');
        Route::post('/library/update', 'ExploreHomeopathController@libraryUpdate')->name('library.update');
        Route::get('/library/remove/{id}', 'ExploreHomeopathController@libraryRemove')->name('library.remove');

    });







    Route::name('shop.')->prefix('shop')->namespace('Shop')->group(function () {

        Route::get('/', 'ShopController@index')->name('index');

        Route::get('/product/detail/{id}', 'ShopController@productDetail')->name('product.detail');
        Route::get('/product/remove/{id}', 'ShopController@productremove')->name('product.remove');
        Route::get('/product/create', 'ShopController@productCreate')->name('create');
        Route::post('/product/store', 'ShopController@productStore')->name('store');
        Route::get('/product/update/{id}', 'ShopController@productupdate')->name('product.update');
        Route::post('/product/edit/{id}', 'ShopController@productEdit')->name('product.edit');


        Route::get('/options', 'ShopOptionController@options')->name('options');


        Route::post('/category/create', 'ShopOptionController@categoryCreate')->name('category.create');
        Route::post('/category/update', 'ShopOptionController@categoryUpdate')->name('category.update');


        Route::post('/brand/create', 'ShopOptionController@brandCreate')->name('brand.create');
        Route::post('/brand/update', 'ShopOptionController@brandUpdate')->name('brand.update');


        Route::post('/variant/create', 'ShopOptionController@variantCreate')->name('variant.create');
        Route::post('/variant/update', 'ShopOptionController@variantUpdate')->name('variant.update');

        Route::post('/color/create', 'ShopOptionController@colorCreate')->name('color.create');
        Route::post('/color/update', 'ShopOptionController@colorUpdate')->name('color.update');


        Route::get('/option/remove/{model}/{id}/{column}', 'ShopOptionController@optionRemove')->name('option.remove');


        Route::get('/orders', 'ShopOrderController@orders')->name('orders');
        Route::get('/order/{id}', 'ShopOrderController@order')->name('order');
        Route::get('/order/status/update/{id}', 'ShopOrderController@orderUpdateStatus')->name('order.update.status');


    });



    Route::name('finance.')->prefix('finance')->group(function () {

        Route::get('/', 'FinanceController@index')->name('index');
        Route::get('/homeopath/revenue', 'FinanceController@homeopathRevenue')->name('homeopath.revenue');
        Route::get('/services/transaction', 'Finance\ServicesTransactionController@servicesTransaction')->name('services.transaction');

        Route::post('/location/tax', 'Finance\LocationTexController@save')->name('location.tax');

    });




    Route::get('/services', 'ServicesController@index')->name('services.index');
    Route::get('/services/{id}/delete', 'ServicesController@delete')->name('services.delete');
    Route::get('/services/{id}/edit', 'ServicesController@edit')->name('services.edit');
    Route::post('/services/create', 'ServicesController@create')->name('services.create');

    Route::get('inquiries', 'InquiryController@inquiries')->name('inquiries');
    Route::get('inquiry/update/{id}', 'InquiryController@inquiryUpdate')->name('inquiry.update');


    Route::get('reports', 'ReportController@reports')->name('reports');
    Route::get('reports/update/status', 'ReportController@reportsStatusUpdate')->name('reports.update.status');


    Route::get('donations', 'DonationController@donations')->name('donations');




    Route::name('member.')->prefix('member')->namespace('Member')->group(function () {

        Route::get('/', 'MemberController@index')->name('index');
        Route::get('/filter', 'MemberController@filter')->name('filter.status');
        Route::get('/detail/{id}', 'MemberController@detail')->name('detail');
        Route::get('/update/{id}/{verify}', 'MemberController@verify')->name('update');
        Route::get('/delete/{id}/{verify}', 'MemberController@delete')->name('delete');


    });

    Route::name('email.')->prefix('email')->namespace('Email')->group(function () {

        Route::get('/edit', 'EmailSettingController@index')->name('invitation');
        Route::get('/setting', 'EmailSettingController@setting')->name('setting');
        Route::post('/welcome/save', 'EmailSettingController@save')->name('save');

        Route::get('/alert', 'EmailSettingController@emailAlert')->name('alert');
    });



    Route::get('badge/requests', 'BadgeController@badgeRequests')->name('badge.requests');
    Route::post('badge/requests/status', 'BadgeController@badgeRequestsStatus')->name('badge.requests.status');


});


    Route::post('intent', 'PaymentController@intent')->name('intent');
    Route::post('shop/intent', 'Front\shop\CheckoutController@intent')->name('shop.intent');
    Route::get('/fake', 'FakeDataController@index');






Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');



require __DIR__.'/auth.php';
