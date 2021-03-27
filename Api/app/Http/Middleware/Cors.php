<?php
/**
* Location: /app/Http/Middleware
*/
namespace App\Http\Middleware;
use Closure;

class Cors
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $headers = [
            'Access-Control-Allow-Origin'      => '*',
            'Access-Control-Allow-Methods'     => 'POST, GET, OPTIONS, PUT, DELETE',
            'Access-Control-Allow-Credentials' => 'true',
            'Access-Control-Max-Age'           => '86400',
            'Access-Control-Allow-Headers'     => 'Authorization,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,X-CSRF-Token,Application,Accept',
            'Access-Control-Expose-Headers'     => 'Content-Disposition'
        ];
        if ($request->isMethod('OPTIONS'))
        {
            return response()->json('{"method":"OPTIONS"}', 200, $headers);
        }
        $response = $next($request);
        foreach($headers as $key => $value)
        {
            $response->headers->set($key, $value);
        }
        return $response;
    }
}
