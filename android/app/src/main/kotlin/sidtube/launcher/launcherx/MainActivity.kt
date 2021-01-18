package sidtube.launcher.launcherx

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val channel = "launcherx"
    var deviceManger: DevicePolicyManager? = null
    var compName: ComponentName? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
            call, result ->
            if (call.method == "lock") {
                deviceManger  = getSystemService(Context.DEVICE_POLICY_SERVICE ) as DevicePolicyManager?;
                compName =  ComponentName( this, DeviceAdmin().javaClass) ;
                var active = deviceManger?.isAdminActive(compName!!)
                if (!active!!) {
                    val intent = Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)
                    intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, compName)
                    startActivityForResult(intent, 0)
                    active = deviceManger?.isAdminActive(compName!!)
                } else {
                    deviceManger?.lockNow()
                }
                result.success(active!!)

            } else {
                result.notImplemented()
            }
        }
    }


}
