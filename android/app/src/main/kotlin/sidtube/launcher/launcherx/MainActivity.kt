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
    private val CHANNEL = "launcherx"
    var deviceManger: DevicePolicyManager? = null
    var compName: ComponentName? = null
    protected val REQUEST_ENABLE = 0

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "lock") {
                print("called")
                deviceManger  = getSystemService(Context.DEVICE_POLICY_SERVICE ) as DevicePolicyManager?;
                compName =  ComponentName( this, "DeviceAdmin") ;
                var active = deviceManger?.isAdminActive(compName!!)
                if (!active!!) {
                    val intent = Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)
                    intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, compName)
                    startActivityForResult(intent, REQUEST_ENABLE)
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
