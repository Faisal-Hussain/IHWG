<?php

namespace App\Traits;
use App\Traits\SearchModel;
use Carbon\Carbon;


trait SearchModel
{

    public function SearchModel($model,$relationship, $columns, $relationship_columns, $table_filter_search = '',$secrelationship=null)
    {

        $model = '\\App\\Models\\'.$model;
        $builder = $model::query();


        if($table_filter_search!=null)
        {
            $builder = $builder->where(function ($q ) use ($columns,$table_filter_search){
                $flag=false;
                foreach ($columns as $value)
                {
                    if($flag==false)
                    {
                        $q = $q->where($value, 'LIKE', "%".$table_filter_search."%");
                        $flag=true;
                    }
                    else{

                        $q = $q->orWhere($value, 'LIKE', "%".$table_filter_search."%");
                    }
                };
            });

            if(count($relationship_columns)>0)
            {
                $builder = $builder->orWhereHas($relationship,function ($q ) use ($relationship_columns,$table_filter_search){
                    $flag=false;
                    foreach ($relationship_columns as $value)
                    {
                        if($flag==false)
                        {
                            $q = $q->Where($value, 'LIKE', "%".$table_filter_search."%");
                            $flag=true;
                        }
                        else {
                            $q = $q->orWhere($value, 'LIKE', "%".$table_filter_search."%");
                        }
                    };
                });

                if ($secrelationship !==null)
                {
                    $builder = $builder->orWhereHas($secrelationship,function ($q ) use ($relationship_columns,$table_filter_search){
                        $flag=false;
                        foreach ($relationship_columns as $value)
                        {
                            if($flag==false)
                            {
                                $q = $q->Where($value, 'LIKE', "%".$table_filter_search."%");
                                $flag=true;
                            }
                            else {
                                $q = $q->orWhere($value, 'LIKE', "%".$table_filter_search."%");
                            }
                        };
                    });
                }
            }

        }



        return $builder;
    }
}
