<?php

namespace App\Traits;
use Illuminate\Support\Facades\Log;
use App\Traits\FirebaseInterface;
use App\Traits\FirebaseLib;

/**
 * Class SyncsWithFirebase
 * @package App\Traits
 */
trait SyncsWithFirebase
{

    /**
     * @var FirebaseInterface|null
     */
    protected $firebaseClient;

    /**
     * Boot the trait and add the model events to synchronize with firebase
     */
    public static function bootSyncsWithFirebase()
    {
        static::created(function ($model) {
            $model->saveToFirebase('set');
            Log::notice($model);
        });
        static::updated(function ($model) {
            $model->saveToFirebase('update');
            Log::notice($model);
        });
        static::deleted(function ($model) {
            $model->saveToFirebase('delete');
            Log::notice($model);
        });
    }

    /**
     * @param FirebaseInterface|null $firebaseClient
     */
    public function setFirebaseClient($firebaseClient)
    {
        $this->firebaseClient = $firebaseClient;
        Log::notice('client set');
    }

    /**
     * @param $mode
     */
    protected function saveToFirebase($mode)
    {
        if (is_null($this->firebaseClient)) {
            $this->firebaseClient = new FirebaseLib(config('services.firebase.database_url'), config('services.firebase.secret'));
        }
        $path = $this->getTable() . '/' . $this->getKey();
        Log::notice($path);
        if ($mode === 'set' && $fresh = $this->fresh()) {
            $var3 = $this->firebaseClient->set($path, $fresh->toArray());
             Log::notice('set');
        } elseif ($mode === 'update' && $fresh = $this->fresh()) {
           $var2 =  $this->firebaseClient->update($path, $fresh->toArray());
             Log::notice($var2);
        } elseif ($mode === 'update') {
           $var4 =  $this->firebaseClient->delete($path);
            Log::notice('delete');
        }

        

    }
}
