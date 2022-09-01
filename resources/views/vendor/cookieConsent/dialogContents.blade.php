<style type="text/css">
    
.cookie-consent {
    position: fixed;
    bottom: 0px;
    width: 100%;
    height: 45px;
    color: #B57726;
    line-height: 20px;
    padding-left: 10px;
    padding-right: 10px;
    font-size: 16px;
    background: #F7E8D4;
    z-index: 120;
    cursor: pointer;
    border-radius: 0px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.js-cookie-consent-agree {
    height: 30px;
    margin-left: 10px;
    width: 120px;
    font-weight: bold;
    color: #B57726;
    padding: 5px;
    font-size: 16px;
    line-height: 10px;
    border-radius: 3px;
    border: none;
    background-color: #F7D1A1;
    box-shadow: 0px 0px 59px -40px rgb(0 0 0 / 75%);
    cursor: pointer;
}
</style>
<div class="js-cookie-consent cookie-consent">

    <span class="cookie-consent__message">
        {!! trans('cookieConsent::texts.message') !!}
    </span>

    <button class="js-cookie-consent-agree cookie-consent__agree">
        {{ trans('cookieConsent::texts.agree') }}
    </button>

</div>
